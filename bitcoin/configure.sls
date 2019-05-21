include:
  - .install
  - .service

/etc/bitcoin/bitcoin.conf:
  file.managed:
    - source: salt://bitcoind/templates/bitcoin_conf.jinja
    - user: bitcoin
    - group: bitcoin
    - mode: 710
    - makedirs: True
    - template: jinja
    - require:
      - user: bitcoind_user
      - group: bitcoind_group
    - watch_in:
      - service: bitcoind_service_running
    - require_in:
      - service: bitcoind_service_running
