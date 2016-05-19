import common
import edify_generator

def MountSystem(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if "format(" in edify.script[i] and "/dev/block/platform/msm_sdcc.1/by-name/system" in edify.script[i]:
            edify.script[i] = 'mount("ext4", "EMMC", "/dev/block/platform/msm_sdcc.1/by-name/system", "/system", "");'
            return

def DeleteSystem(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if "mount(" in edify.script[i] and "/system" in edify.script[i]:
            edify.script[i] = 'delete_recursive("/system");'
            return

def FullOTA_InstallEnd(info):
    DeleteSystem(info)
    MountSystem(info)
