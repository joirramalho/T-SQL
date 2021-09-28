SELECT
-- ConnectionProperty('net_transport') AS 'net_transport',
-- ConnectionProperty('protocol_type') AS 'protocol_type',
-- ConnectionProperty('auth_scheme') AS 'auth_scheme',
ConnectionProperty('local_net_address') AS 'local_net_address',
ConnectionProperty('local_tcp_port') AS 'local_tcp_port'
-- ConnectionProperty('client_net_address') AS 'client_net_address',
-- ConnectionProperty('physical_net_transport') AS 'physical_net_transport'