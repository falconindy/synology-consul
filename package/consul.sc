[consul_ui_port]
title="consul UI"
desc="consul UI"
port_forward="yes"
dst.ports="8500,8501/tcp"

[consul_grpc_port]
title="consul gRPC"
desc="consul gRPC"
port_forward="yes"
dst.ports="8300,8503/tcp"

[consul_serf_port]
title="consul Serf"
desc="consul Serf"
port_forward="yes"
dst.ports="8301,8302/tcp,udp"
