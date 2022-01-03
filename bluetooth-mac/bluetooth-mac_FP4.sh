#!/vendor/bin/sh
BT_MACADDR=/mnt/vendor/persist/t2m_param/bt_macaddr

setprop persist.vendor.service.bdroid.bdaddr $(cat "$BT_MACADDR")
