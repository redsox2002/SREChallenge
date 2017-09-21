def test_passwd_file(host):
    passwd = host.file("/etc/passwd")
    assert passwd.contains("root")
    assert passwd.user == "root"
    assert passwd.group == "root"
    assert passwd.mode == 0o644


def test_nginx_is_installed(host):
    nginx = host.package("nginx")
    assert nginx.is_installed
    assert nginx.version.startswith("1.12.1")


def test_nginx_running_and_enabled(host):
    nginx = host.service("nginx")
    assert nginx.is_running
    assert nginx.is_enabled


def test_ssl_cert_is_present(host):
    ssl = host.file("/etc/nginx/ssl/server.crt")
    assert ssl.exists


def test_index_file_is_present(host):
    index = host.file("/usr/share/nginx/html/index.html")
    assert index.exists
