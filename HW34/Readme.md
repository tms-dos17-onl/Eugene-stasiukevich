## 1. Установить Terraform.
```
H:\DevOps> terraform -version
Terraform v1.7.3
on windows_amd64
```
## 2. Написать шаблон для создания виртуальной машины в облаке.
```
provider "google" {
  credentials = "./infectdream-study.json"
  project     = "mindful-coder-406008"
  region      = "us-central1"
  zone        = "us-central1-a"
}
resource "google_compute_instance" "Infectdream-terraform" {
  name         = "vm-from-terraform"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "terraform"
      }
    }
  }
  network_interface {
    network = "default"
  }
}
```
## 3. Познакомиться с командами:
- terraform init
- terraform fmt
- terraform validate
- terraform plan
- terraform apply
- terraform destroy
```
terraform init - инициализирует рабочий каталог, содержащий файлы конфигурации Terraform.
terraform fmt - используется для перезаписи файлов конфигурации Terraform в канонический формат и стиль.
terraform validate - проверяет файлы конфигурации в каталоге, обращаясь только к конфигурации и не обращаясь к каким-либо удаленным службам
terraform plan - создает план выполнения, который позволяет вам просмотреть изменения, которые Terraform планирует внести в вашу инфраструктуру
terraform apply - выполняет действия, предложенные в плане Terraform
terraform destroy - способ уничтожить все удаленные объекты, управляемые определенной конфигурацией Terraform.
```
## 4. Создать виртуальную машину в облаке при помощи ранее созданного шаблона.
```
PS H:\DevOps\terraform> terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_compute_instance.infectdreamtf will be created
  + resource "google_compute_instance" "infectdreamtf" {
      + can_ip_forward       = false
      + cpu_platform         = (known after apply)
      + current_status       = (known after apply)
      + deletion_protection  = false
      + effective_labels     = (known after apply)
      + guest_accelerator    = (known after apply)
      + id                   = (known after apply)
      + instance_id          = (known after apply)
      + label_fingerprint    = (known after apply)
      + machine_type         = "e2-medium"
      + metadata_fingerprint = (known after apply)
      + min_cpu_platform     = (known after apply)
      + name                 = "infectdreamtf"
      + project              = "mindful-coder-406008"
      + self_link            = (known after apply)
      + tags_fingerprint     = (known after apply)
      + terraform_labels     = (known after apply)
      + zone                 = "us-west1-b"

      + boot_disk {
          + auto_delete                = true
          + device_name                = (known after apply)
          + disk_encryption_key_sha256 = (known after apply)
          + kms_key_self_link          = (known after apply)
          + mode                       = "READ_WRITE"
          + source                     = (known after apply)

          + initialize_params {
              + image                  = "debian-cloud/debian-11"
              + labels                 = {
                  + "my_label" = "terraform"
                }
              + provisioned_iops       = (known after apply)
              + provisioned_throughput = (known after apply)
              + size                   = (known after apply)
              + type                   = (known after apply)
            }
        }

      + network_interface {
          + internal_ipv6_prefix_length = (known after apply)
          + ipv6_access_type            = (known after apply)
          + ipv6_address                = (known after apply)
          + name                        = (known after apply)
          + network                     = "default"
          + network_ip                  = (known after apply)
          + stack_type                  = (known after apply)
          + subnetwork                  = (known after apply)
          + subnetwork_project          = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_compute_instance.infectdreamtf: Creating...
google_compute_instance.infectdreamtf: Still creating... [10s elapsed]
google_compute_instance.infectdreamtf: Still creating... [20s elapsed]
google_compute_instance.infectdreamtf: Creation complete after 23s [id=projects/mindful-coder-406008/zones/us-west1-b/instances/infectdreamtf]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
![image](https://github.com/tms-dos17-onl/Eugene-stasiukevich/assets/100120414/f3392087-9690-410b-9df2-bfedb4f2a021)

## 5. Поменять тип виртуальной машины (увеличить количество ресурсов) через веб консоль и выполнить terraform plan. Что предлагает сделать Terraform?
```
H:\DevOps\terraform> terraform plan
google_compute_instance.infectdreamtf: Refreshing state... [id=projects/mindful-coder-406008/zones/us-west1-b/instances/infectdreamtf]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # google_compute_instance.infectdreamtf will be updated in-place
  ~ resource "google_compute_instance" "infectdreamtf" {
        id                   = "projects/mindful-coder-406008/zones/us-west1-b/instances/infectdreamtf"
      ~ machine_type         = "e2-standard-2" -> "e2-medium"
        name                 = "infectdreamtf"
        tags                 = []
        # (18 unchanged attributes hidden)

        # (4 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```
Terraform предлагает изменить тип виртуальной машины.
