module "glpi-subnet" {
  source              = "github.com/rafikbahri/tf-aws-private-subnet"
  name                = "glpi-subnet"
  vpc_id              = module.main-vpc.vpc_id
  availability_zone   = "eu-west-3a"
  cidr_block          = var.glpi_subnet_cidr
  public_subnet_id    = module.bastions-subnet.subnet_id
  has_internet_access = true
  tags = {
    kind  = "private"
    group = "glpi"
  }
}

module "sg-glpi-ec2" {
  source      = "github.com/rafikbahri/tf-aws-sg"
  name        = "sg_glpi_ec2"
  description = "GLPI EC2 security group"
  vpc_id      = module.main-vpc.vpc_id
  ingress_rules = [
    {
      description      = "Allow HTTP access from anywhere."
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "Allow HTTPS access from anywhere."
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]
  egress_rules = [
    {
      description      = "Allow all outbound traffic."
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]
  tags = {
    component = "glpi"
    tier      = "infra"
  }
}

module "glpi-cluster" {
  source          = "github.com/rafikbahri/tf-aws-node"
  server_count    = var.glpi_cluster_servers_count
  server_prefix   = "glpi"
  ami_id          = "ami-0546127e0cf2c6498"
  instance_type   = "t2.micro"
  vpc_id          = module.main-vpc.vpc_id
  subnet_id       = module.glpi-subnet.subnet_id
  private_ips     = [["10.0.16.11"]]
  create_key      = false
  security_groups = [module.sg-admin.sg_id, module.sg-glpi-ec2.sg_id]
  user_data_file  = ".config/cloudinit_user_data.yaml"
  tags = {
    component = "glpi"
    tier      = "infra"
  }
}

module "db-subnet-1" {
  source            = "github.com/rafikbahri/tf-aws-private-subnet"
  name              = "db-subnet-1"
  vpc_id            = module.main-vpc.vpc_id
  availability_zone = "eu-west-3a"
  cidr_block        = var.db_subnet_1_cidr
  tags = {
    kind  = "private"
    group = "mariadb"
  }
}

module "db-subnet-2" {
  source            = "github.com/rafikbahri/tf-aws-private-subnet"
  name              = "db-subnet-2"
  vpc_id            = module.main-vpc.vpc_id
  availability_zone = "eu-west-3b"
  cidr_block        = var.db_subnet_2_cidr
  tags = {
    kind  = "private"
    group = "mariadb"
  }
}

resource "aws_db_subnet_group" "glpi_db_subnet_group" {
  name       = "glpi-db-subnet-group"
  subnet_ids = [module.db-subnet-1.subnet_id, module.db-subnet-2.subnet_id]

  tags = {
    Name = "GLPI DB Subnet Group"
  }
}

module "sg-glpi-rds" {
  source      = "github.com/rafikbahri/tf-aws-sg"
  name        = "sg_glpi_rds"
  description = "GLPI RDS security group"
  vpc_id      = module.main-vpc.vpc_id
  ingress_rules = [
    {
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      security_groups  = [module.sg-glpi-ec2.sg_id]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      description      = "Allow MySQL access from GLPI"
      cidr_blocks      = [var.glpi_subnet_cidr]
    }
  ]
}

resource "aws_db_instance" "glpi_db" {
  allocated_storage     = 20
  max_allocated_storage = 100 # For auto-scaling
  storage_type          = "gp3"
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.medium"
  identifier            = "glpi-db"
  db_name               = "glpi"
  username              = var.glpi_db_username
  password              = var.glpi_db_password
  parameter_group_name  = "default.mysql8.0"
  db_subnet_group_name  = aws_db_subnet_group.glpi_db_subnet_group.name
  vpc_security_group_ids = [
    module.sg-glpi-rds.sg_id
  ]
  multi_az            = true
  skip_final_snapshot = true

  tags = {
    Name = "glpi-db"
  }
}
