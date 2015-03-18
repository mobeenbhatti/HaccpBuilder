using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolHaccp.Common
{
   public class HaccpUser
    {
       public HaccpUser()
       {

       }
        #region Primitive Properties

        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>        
        public Int32 ContactId
        {
            get
            {
                return _ContactId;
            }
            set
            {
                if (_ContactId != value)
                {                    
                    _ContactId = value;                    
                }
            }
        }
        private global::System.Int32 _ContactId;
        
        public String Name
        {
            get
            {
                return _Name;
            }
            set
            {                
                _Name = value;               
            }
        }
        private String _Name;
       
        public String Password
        {
            get
            {
                return _Password;
            }
            set
            {                
                _Password = value;               
            }
        }
        private String _Password;

        public String PasswordSalt
        {
            get
            {
                return _PasswordSalt;
            }
            set
            {
                _PasswordSalt = value;
            }
        }
        private String _PasswordSalt;
        
        public String EmailAddress
        {
            get
            {
                return _EmailAddress;
            }
            set
            {                
                _EmailAddress = value;                
            }
        }
        private String _EmailAddress;
        
        public Int32 EmailAlerts
        {
            get
            {
                return _EmailAlerts;
            }
            set
            {                
                _EmailAlerts = value;               
            }
        }
        private Int32 _EmailAlerts;
       
        public String PrimaryPhone
        {
            get
            {
                return _PrimaryPhone;
            }
            set
            {                
                _PrimaryPhone = value;               
            }
        }
        private String _PrimaryPhone;
        
        public String SecondaryPhone
        {
            get
            {
                return _SecondaryPhone;
            }
            set
            {                
                _SecondaryPhone = value;               
            }
        }
        private String _SecondaryPhone;
        
        public String Fax
        {
            get
            {
                return _Fax;
            }
            set
            {               
                _Fax = value;               
            }
        }
        private String _Fax;
        
        public DateTime CreatedDate
        {
            get
            {
                return _CreatedDate;
            }
            set
            {
                
                _CreatedDate = value;
               
            }
        }
        private DateTime _CreatedDate;
        
        public DateTime ModifiedDate
        {
            get
            {
                return _ModifiedDate;
            }
            set
            {                
                _ModifiedDate = value;               
            }
        }
        private DateTime _ModifiedDate;
        
        public String UserId
        {
            get
            {
                return _UserId;
            }
            set
            {                
                _UserId = value;               
            }
        }
        private String _UserId;        
       
        
        public global::System.String Initials
        {
            get
            {
                return _Initials;
            }
            set
            {
                
                _Initials = value;
                
            }
        }
        private String _Initials;

        public global::System.Boolean IsUpdated
        {
            get
            {
                return _IsUpdated;
            }
            set
            {

                _IsUpdated = value;

            }
        }

        private Boolean _IsUpdated;
        
        #endregion
    }
}
