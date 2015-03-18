using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
  public  class Contact
    {
      private int m_ContactId;
      private string m_Name;
      private string m_AddressOne;
      private string m_AddressTwo;
      private string m_City;
      private string m_Email;
      private string m_State;
      private int m_ZipCode;
      private string m_Phone;
      private string m_AltPhone;
      private string m_Fax;
      private int m_EmailAlerts;
      private string m_UserId;
      private string m_Password;
      private string m_RoleName;
      private int m_phpUserId;
      private int m_Active;
      private string m_Initials;
      private string m_PasswordSalt;
      private bool m_IsUpdated;
     

      public int phpUserId
      {
          get { return m_phpUserId; }
          set { m_phpUserId = value; }
      }
      public int ContactId
      {
          get
          {
              return this.m_ContactId;
          }
          set
          {
              this.m_ContactId = value;
          }
      }
      public string AddressOne
      {
          get
          {
              return this.m_AddressOne;
          }
          set
          {
              this.m_AddressOne = value;
          }
      }

      public string AddressTwo
      {
          get
          {
              return this.m_AddressTwo;
          }
          set
          {
              this.m_AddressTwo = value;
          }
      }

      public string AltPhone
      {
          get
          {
              return this.m_AltPhone;
          }
          set
          {
              this.m_AltPhone = value;
          }
      }

      public string City
      {
          get
          {
              return this.m_City;
          }
          set
          {
              this.m_City = value;
          }
      }
      public string Email
      {
          get
          {
              return this.m_Email;
          }
          set
          {
              this.m_Email = value;
          }
      }

      public string Fax
      {
          get
          {
              return this.m_Fax;
          }
          set
          {
              this.m_Fax = value;
          }
      }

      public string Name
      {
          get
          {
              return this.m_Name;
          }
          set
          {
              this.m_Name = value;
          }
      }

      public string Phone
      {
          get
          {
              return this.m_Phone;
          }
          set
          {
              this.m_Phone = value;
          }
      }

      public string State
      {
          get
          {
              return m_State;
          }
          set
          {
              this.m_State = value;
          }
      }

      public int ZipCode
      {
          get
          {
              return m_ZipCode;
          }
          set
          {
              this.m_ZipCode = value;
          }
      }
      public int EmailAlerts
      {
          get
          {
              return this.m_EmailAlerts;
          }
          set
          {
              this.m_EmailAlerts = value;
          }
      }
      public string UserId
      {
          get
          {
              return this.m_UserId;
          }
          set
          {
              this.m_UserId = value;
          }
      }
      public string Password
      {
          get
          {
              return this.m_Password;
          }
          set
          {
              this.m_Password = value;
          }
      }
      public string Initials
      {
          get
          {
              return this.m_Initials;
          }
          set
          {
              this.m_Initials = value;
          }
      }
      public string RoleName
      {
          get
          {
              return this.m_RoleName;
          }
          set
          {
              this.m_RoleName = value;
          }
      }
      public int Active
      {
          get
          {
              return m_Active;
          }
          set
          {
              this.m_Active = value;
          }
      }
      public string PasswordSalt
      {
          get
          {
              return this.m_PasswordSalt;
          }
          set
          {
              this.m_PasswordSalt = value;
          }
      }
      public bool IsUpdated
      {
          get
          {
              return m_IsUpdated;
          }
          set
          {
              this.m_IsUpdated = value;
          }
      }
    }
}
