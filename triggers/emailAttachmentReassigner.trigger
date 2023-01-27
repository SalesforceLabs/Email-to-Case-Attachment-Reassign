// Jonathan Hersh - jhersh@salesforce.com
// November 13, 2008

trigger emailAttachmentReassigner on Attachment (before insert) {
	for( Attachment a : trigger.new ) {
		// Check the parent ID - if it's 02s, this is for an email message
		if( a.parentid == null )
			continue;
		
		String s = string.valueof( a.parentid );
		
		if( s.substring( 0, 3 ) == '02s' )
			a.parentid = [select parentID from EmailMessage where id = :a.parentid].parentID;
			
	}
}