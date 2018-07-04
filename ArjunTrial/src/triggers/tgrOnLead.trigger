trigger tgrOnLead on Lead(before INSERT, before UPDATE) {
	system.debug('tgrOld Map:::::' + trigger.OldMap);
}