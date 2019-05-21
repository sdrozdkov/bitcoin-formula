=======
Bitcoin node formula
=======

Formula to install and configure bitcoin node.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``bitcoin``
--------

Install, configure and run systemd unit bitcoind.

``bitcoin.install``
--------

Install Bitcoin Node.

``bitcoin.configure``
--------

Configures Bitcoin node.

``bitcoin.service``
--------

Configure and start bitcoin systemd service.

Example
=======

See *pillar.example*.

