node default {

  # super:0x892bd158de5ce05f7792112eca1be3ca is generated by
  # turnadmin -k -u super -r mydomain.com -p super
  # and is valid for user: super and password: super and realm: mydomain.com
  class{ 'coturn':
    mice => true,
    static_user_accounts => ['admin:admin', 'super:0x892bd158de5ce05f7792112eca1be3ca'],
    realm => 'mydomain.com',
  }

  include 'ssh'
  include 'ufw'
}