# Main or rather misc.tf, where in this case the data archive will live
# A bit of explanation:
# this resource will create an archive file, whose type is zip, from the lambda.py

data "archive_file" "pets_script" {
    type = "zip"
    source_file = "${path.module}/files/${var.script_filename}.py"
    output_file = "${path.module}/files/${var.script_filename}.zip"
}