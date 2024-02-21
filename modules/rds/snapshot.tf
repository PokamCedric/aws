# get the latest db snapshot
# terraform aws data db snapshot
resource "aws_db_snapshot" "this" {
  db_instance_identifier = aws_db_instance.this.identifier
  db_snapshot_identifier = var.snapshot_identifier
}

