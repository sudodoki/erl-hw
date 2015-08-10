{application, app_2,
 [{description, "First application"},
  {vsn, "1.0"},
  {modules, [app_2_sup, looper]}, % we've added our supervisor here
  {registered, []},
  {applications, [kernel, stdlib]},
  {mod, {app_2,[]}}
  ]}.
