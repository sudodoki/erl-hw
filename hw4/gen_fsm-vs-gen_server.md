| `gen_server` | `gen_fsm`          |
| ------------ | ------------------ |
| init/1       | init/1             |
| terminate/2  | terminate/3        |
|              | StateName/2        |
|              | StateName/3        |
| handle_call/3| handle_event/3     |
| handle_cast/2|                    |
| handle_info/2|                    |
|              | handle_sync_event/4|
| code_change/3|   code_change/4    |
