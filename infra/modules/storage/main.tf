resource "aws_ebs_volume" "glpi_config" {
  availability_zone = var.availability_zones[0]
  size              = var.glpi_config_ebs_volume_size
  type              = var.glpi_config_ebs_volume_type
  encrypted         = true

  tags = {
    Name        = "glpi-config-volume"
    Type        = "glpi-config"
    Description = "EBS Volume for GLPI Configuration (/etc/glpi)"
  }
}

resource "aws_ebs_volume" "glpi_data" {
  availability_zone = var.availability_zones[0]
  size              = var.glpi_data_ebs_volume_size
  type              = var.glpi_data_ebs_volume_type
  encrypted         = true

  tags = {
    Name        = "glpi-data-volume"
    Type        = "glpi-data"
    Description = "EBS Volume for GLPI Data (/var/lib/glpi)"
  }
}

resource "aws_ebs_volume" "glpi_logs" {
  availability_zone = var.availability_zones[0]
  size              = var.glpi_logs_ebs_volume_size
  type              = var.glpi_logs_ebs_volume_type
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
  instance_id = var.glpi_instance_id
}

resource "aws_volume_attachment" "glpi_data_attachment" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.glpi_data.id
  instance_id = var.glpi_instance_id
}

resource "aws_volume_attachment" "glpi_logs_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.glpi_logs.id
  instance_id = var.glpi_instance_id
}