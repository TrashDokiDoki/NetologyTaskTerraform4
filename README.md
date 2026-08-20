# NetologyTaskTerraform4

# Домашнее задание к занятию «Продвинутые методы работы с Terraform»

# Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания с помощью двух вызовов remote-модуля -> двух ВМ, относящихся к разным проектам(marketing и analytics) используйте labels для обозначения принадлежности.  В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл cloud-init.yml установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```, скриншот консоли ВМ yandex cloud с их метками. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.marketing_vm
------
В случае использования MacOS вы получите ошибку "Incompatible provider version" . В этом случае скачайте remote модуль локально и поправьте в нем версию template провайдера на более старую.
------

# Решение

1. Создал `cloud-init.yml`

<img width="1053" height="343" alt="Снимок экрана 2026-08-18 185941" src="https://github.com/user-attachments/assets/661a0baf-40e4-4beb-a543-7c7d61fbf549" />

2. Далее я описал `main.tf` по примеру из демонстрации, но немного убавил хардкод

<img width="1519" height="996" alt="Снимок экрана 2026-08-18 195951" src="https://github.com/user-attachments/assets/71617b69-e14b-4969-bac1-1bf6f7fddfa0" />

<img width="1666" height="1014" alt="Снимок экрана 2026-08-18 200034" src="https://github.com/user-attachments/assets/e89732e2-0bda-42a8-8761-36d7f3e71f4f" />

3. Подключился к ВМ и выполнил команду `sudo nginx -t`, после в `terraform console` запросил вывод модуля `marketing`

<img width="691" height="498" alt="Снимок экрана 2026-08-18 200251" src="https://github.com/user-attachments/assets/d16e0771-5d85-42d7-9b23-d7b90a22a18a" />

<img width="827" height="951" alt="Снимок экрана 2026-08-18 200328" src="https://github.com/user-attachments/assets/d3871e47-e898-41b6-a420-c591c5d9d38c" />

<img width="643" height="969" alt="Снимок экрана 2026-08-18 200350" src="https://github.com/user-attachments/assets/eed6d867-1b7b-47ba-b906-6f24555f5778" />

<img width="557" height="966" alt="Снимок экрана 2026-08-18 200402" src="https://github.com/user-attachments/assets/b144cbcf-6844-4d5a-a02d-53e59964b626" />

# Задание 2

1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev  
4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
5. Сгенерируйте документацию к модулю с помощью terraform-docs.
 
Пример вызова

```
module "vpc_dev" {
  source       = "./vpc"
  env_name     = "develop"
  zone = "ru-central1-a"
  cidr = "10.0.1.0/24"
}
```

# Решение

1. Создал подкаталог `vpc`. Внутри данного подкаталога создал файлы, которые описывают модуль на создание двух ресурсов.

<img width="1803" height="1015" alt="Снимок экрана 2026-08-18 214407" src="https://github.com/user-attachments/assets/f04ef621-92d4-45d3-86eb-cb272277691f" />

2. Далее я заменил ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем.

<img width="1919" height="1079" alt="Снимок экрана 2026-08-18 214602" src="https://github.com/user-attachments/assets/c8c49edb-eeab-4f9a-b5a6-487e4924e231" />

3. После изменений выполнил destroy и apply(мог сделать через удаление ресурсов по отдельности, но не стал)

<img width="1903" height="1057" alt="Снимок экрана 2026-08-18 220507" src="https://github.com/user-attachments/assets/daac61c5-4873-49a4-81c8-5e558e631665" />

4. Сгенерировал документацию к модулю с помощью terraform-docs.

<img width="1919" height="1079" alt="Снимок экрана 2026-08-18 220556" src="https://github.com/user-attachments/assets/1db26c5f-e6b3-4e89-b351-ef00e0c4df59" />

# Задание 3
1. Выведите список ресурсов в стейте.
2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Значимых(!!) изменений быть не должно.
Приложите список выполненных команд и скриншоты процессы.

# Решение

1. Вывел список ресурсов в стейте

<img width="532" height="171" alt="Снимок экрана 2026-08-18 220720" src="https://github.com/user-attachments/assets/db06da35-7ee6-4512-a807-3bf3d3fdb039" />

2. Полностью удалил из стейта модуль vpc

<img width="707" height="145" alt="Снимок экрана 2026-08-18 220944" src="https://github.com/user-attachments/assets/e4a2b598-1e3f-47aa-83e3-317e85030c1d" />

3. Полностью удалил из стейта модуль vm

<img width="678" height="258" alt="Снимок экрана 2026-08-18 221250" src="https://github.com/user-attachments/assets/c398a617-fc02-426b-98c9-06be37373dd3" />

<img width="977" height="471" alt="Снимок экрана 2026-08-18 221305" src="https://github.com/user-attachments/assets/cad828fc-5a29-4073-b863-def07a17a449" />

4. Импортировал всё обратно и выполнил проверку

<img width="953" height="1003" alt="Снимок экрана 2026-08-18 221620" src="https://github.com/user-attachments/assets/fc9dfe63-69c8-44bb-9e61-59a7792b0862" />

<img width="1919" height="1079" alt="Снимок экрана 2026-08-18 222022" src="https://github.com/user-attachments/assets/f955f121-3b2e-49c3-aeb8-180244f8c625" />

В итоге после выполнения `apply` мы видим, что изменения не значительные

<img width="1914" height="1079" alt="Снимок экрана 2026-08-18 222210" src="https://github.com/user-attachments/assets/064f1267-d1f1-4748-8744-ed3199d36b14" />
