bitcoind_service_running:
  service.running:
    - name: bitcoind
    - enable: True
    - require:
      - file: /lib/systemd/system/bitcoind.service
