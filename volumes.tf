resource "aws_ebs_volume" "glpi_config" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 5
  type              = "gp2"
  encrypted         = true

  tags = {
    Name        = "glpi-config-volume"
    Type        = "glpi-config"
    Description = "EBS Volume for GLPI Configuration (/etc/glpi)"
  }
}

resource "aws_ebs_volume" "glpi_data" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    Name        = "glpi-data-volume"
    Type        = "glpi-data"
    Description = "EBS Volume for GLPI Data (/var/lib/glpi)"
  }
}

resource "aws_ebs_volume" "glpi_logs" {
  availability_zone = data.aws_availability_zones.available.names[0]
  size              = 20
  type              = "gp2"
  encrypted         = true

  tags = {
    Name        = "glpi-logs-volume"
    Type        = "glpi-logs"
    Description = "EBS Volume for GLPI Logs (/var/log/glpi)"
  }
}

resource "aws_volume_attachment" "glpi_config_attachment" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.glpi_config.id
  instance_id = aws_instance.glpi_instance.id
}

resource "aws_volume_attachment" "glpi_data_attachment" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.glpi_data.id
  instance_id = aws_instance.glpi_instance.id
}

resource "aws_volume_attachment" "glpi_logs_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.glpi_logs.id
  instance_id = aws_instance.glpi_instance.id
}