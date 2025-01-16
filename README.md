# terraform

Step by step :
1. pertama anda buat pada access management lalu pilih create user
2. setelah itu buat role sesuaikan dengan apa yang mau dibuat kalo disini karena saya buat instance saya pilih aws service dan pilih administrator access.
3. pastikan sudah menjalankan access key dan secret key yang di dapat dari IAM
4. dan jalankan pada bash komputer lokal dengan command aws configure.
5. lalu masukkan access key, secret key, zone, dan format json. setelah itu jangan lupa buat key pairs agar komputer lokal dan aws bisa ssh.
7. baru jalankan perintah terraform init, plan dan apply.
