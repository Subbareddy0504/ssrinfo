project_id     = "jaya-edu-2"
region         = "us-east4"
bucket_name    = "my-bucket-devops-0504"
location       = "US"
storage_class  = "STANDARD"
force_destroy  = true 

enable_lifecycle = true

lifecycle_rules = [
  {
    action_type           = "Delete"
    condition_age         = 30
    condition_prefixes    = ["temp/", "logs/", "backup/"]
  },
  {
    action_type            = "SetStorageClass"
    action_storage_class   = "NEARLINE"
    condition_age          = 60
    matches_storage_class  = ["STANDARD"]
    condition_prefixes     = ["logs/"]
  },
  {
    action_type            = "SetStorageClass"
    action_storage_class   = "COLDLINE"
    condition_age          = 120
    matches_storage_class  = ["NEARLINE"]
    condition_prefixes     = ["backup/"]
  },
  {
    action_type            = "SetStorageClass"
    action_storage_class   = "ARCHIVE"
    condition_age          = 180
    matches_storage_class  = ["COLDLINE"]
    condition_prefixes     = ["logs/folder1/", "backup/folder2/"]
    condition_suffixes     = [".csv"]
  }
]