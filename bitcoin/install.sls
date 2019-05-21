bitcoind_group:
  group.present:
    - name: bitcoin
    - gid: 1011

bitcoind_user:
  user.present:
    - name: bitcoin
    - uid: 1011
    - gid: 1011
    - shell: /usr/sbin/nologin
    - createhome: False
    - groups:
      - bitcoin
  
/var/lib/bitcoind:
  file.directory:
    - user: bitcoin
    - group: bitcoin
    - dir_mode: 710
    - file_mode: 600
    - recurse:
      - user
      - group
      - mode
      - ignore_dirs

bitcoin_download:
  archive.extracted:
    - name: /root/bitcoin
    - source: https://bitcoin.org/bin/bitcoin-core-0.17.1/bitcoin-0.17.1-x86_64-linux-gnu.tar.gz
    - source_hash: 53ffca45809127c9ba33ce0080558634101ec49de5224b2998c489b6d0fc2b17
    - require_in:
      - bitcoin_install

bitcoin_install:
  cmd.run:
    - name: install -m 0755 -o root -g root -t /usr/bin /root/bitcoin/bitcoin-0.17.1/bin/*
    - unless: test -f /usr/bin/bitcoind
    - require:
      - bitcoin_download

bitcoind_systemd_config:
  file.managed:
    - name: /lib/systemd/system/bitcoind.service
    - source: salt://bitcoind/files/bitcoind.service
    - require:
      - user: bitcoind_user
      - bitcoin_install
