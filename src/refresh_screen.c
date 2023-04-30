#include <fcntl.h>
#include <sys/ioctl.h>
#include <drm.h>

typedef int bool;

struct drm_rockchip_ebc_trigger_global_refresh {
	bool trigger_global_refresh;
};

#define DRM_IOCTL_ROCKCHIP_EBC_GLOBAL_REFRESH  DRM_IOWR(DRM_COMMAND_BASE + 0x00, struct drm_rockchip_ebc_trigger_global_refresh)

int main()
{
	int fd = open("/dev/dri/by-path/platform-fdec0000.ebc-card", DRM_RDWR);
	if(fd < 0) {
		return 1;
	}
	struct drm_rockchip_ebc_trigger_global_refresh arg;
	arg.trigger_global_refresh = 1;
	int ret = ioctl(fd, DRM_IOCTL_ROCKCHIP_EBC_GLOBAL_REFRESH, &arg);
	return ret;
}

