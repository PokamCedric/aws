# create database instance restored from db snapshots
# terraform aws db instance
resource "aws_db_instance" "this" {
  allocated_storage       = var.storage
  db_name                 = var.db_name
  engine                  = var.engine
  engine_version          = var.engine_version
  username                = var.username
  password                = var.password
  instance_class          = var.instance_class
  skip_final_snapshot     = true # avoid creating snapshot when we destroy
  availability_zone       = var.availability_zone
  identifier              = var.instance_identifier
  db_subnet_group_name    = aws_db_subnet_group.this.name
  multi_az                = var.multi_az
  vpc_security_group_ids  = var.security_group_ids
  backup_retention_period = 0 # 0 disables automated backups, et the backup retention period of a multi-AZ DB cluster to between 1 and 35 days
}
