public class emailAttachmentReassignerTest {
        static testmethod void attachmentTester() {
            Case c = new Case();
            insert c;
            
            EmailMessage em = new EmailMessage();
            em.parentId = c.id;
            em.MessageDate = Date.today();
            em.FromAddress = 'test@from.com';
            em.ToAddress = 'test@to.com';
            em.Subject = 'test subject';
            em.TextBody = 'heres a text body.';
            insert em;
                    
        
            Attachment a = new Attachment();
            a.name = 'test attachment';
            a.body = blob.valueof('attachment body');
            a.parentid = em.id;
            insert a;   
            
            List<Attachment> attachments = [Select Id From Attachment Where parentId = :c.id];
            
            System.assert(attachments.size() == 1, 'Wrong number of attachments (( ' + attachments.size() );
        }   
    }