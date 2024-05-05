#import <Foundation/Foundation.h>
#include <spawn.h>
#include <roothide.h>

NSDictionary *prefs;

%hook SpringBoard
-(void)applicationDidFinishLaunching:(bool)arg1{
	%orig();
	for(NSString *daemon in [prefs allKeys]){
		if([[prefs objectForKey:daemon] boolValue] == FALSE){
			pid_t pid;
            posix_spawn(&pid, jbroot("/usr/libexec/launchctl_wrapper"), NULL, NULL, (char *const *)(const char *[]){"launchctl_wrapper", "unload", jbroot(daemon).UTF8String, NULL}, NULL);
		}
	}
}
%end

%ctor{
	prefs = [NSDictionary dictionaryWithContentsOfFile:jbroot(@"/var/mobile/Library/Preferences/com.level3tjg.daemondisabler.plist")];
}