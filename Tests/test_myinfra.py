def test_passwd_file(host):
    passwd = host.file("/etc/passwd")
    assert passwd.contains("root")
    assert passwd.user == "root"
    assert passwd.group == "root"
    assert passwd.mode == 0o644


def test_java_is_installed(host):
    java = host.package("java")
    assert java.is_installed

def test_node_is_installed(host):
    node = host.package("node")
    assert node.is_installed

def test_ruby_is_installed(host):
    ruby = host.package("ruby")
    assert ruby.is_installed