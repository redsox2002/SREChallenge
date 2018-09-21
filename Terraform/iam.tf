resource "aws_iam_instance_profile" "s3_read_only" {
    name = "s3_read_only"
    role = "${aws_iam_role.s3_read_only_role.name}"
}

resource "aws_iam_role" "s3_read_only_role" {
    name = "s3_read_only_role"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
            "Service": "ec2.amazonaws.com"
        },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "s3_read_only_policy" {
  name = "s3_read_only_policy"
  description = "read-only rights to s3"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucketByTags",
                "s3:GetLifecycleConfiguration",
                "s3:GetBucketTagging",
                "s3:GetInventoryConfiguration",
                "s3:GetObjectVersionTagging",
                "s3:ListBucketVersions",
                "s3:GetBucketLogging",
                "s3:ListBucket",
                "s3:GetAccelerateConfiguration",
                "s3:GetBucketPolicy",
                "s3:GetObjectVersionTorrent",
                "s3:GetObjectAcl",
                "s3:GetEncryptionConfiguration",
                "s3:GetBucketRequestPayment",
                "s3:GetObjectVersionAcl",
                "s3:GetObjectTagging",
                "s3:GetMetricsConfiguration",
                "s3:HeadBucket",
                "s3:GetIpConfiguration",
                "s3:ListBucketMultipartUploads",
                "s3:GetBucketWebsite",
                "s3:GetBucketVersioning",
                "s3:GetBucketAcl",
                "s3:GetBucketNotification",
                "s3:GetReplicationConfiguration",
                "s3:ListMultipartUploadParts",
                "s3:GetObject",
                "s3:GetObjectTorrent",
                "s3:ListAllMyBuckets",
                "s3:GetBucketCORS",
                "s3:GetAnalyticsConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetBucketLocation",
                "s3:GetObjectVersion"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3_read_only_attach" {
    role       = "${aws_iam_role.s3_read_only_role.name}"
    policy_arn = "${aws_iam_policy.s3_read_only_policy.arn}"
}