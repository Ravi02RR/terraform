resource "local_file" "sample_file" {
  content  = "This is a sample file created by Terraform."
  filename = "${path.module}/sample.txt"

}
