using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;

namespace SchoolHaccp.Common
{
    public class MenuRecipe
    {
      private int m_MenuRecipeID;
      private int m_MenuID;
      private string m_PortionSize;
      private string m_Yield;
      private string  m_Preparation;
      private string  m_WrittenBy;
      private DateTime  m_EntryDate;
      private DateTime  m_ModifiedDate;


        public MenuRecipe()
        {
        }

        ///<summary>
        /// Creates a new <see cref="MenuItemsNewBase"/> instance by taking parameters.
        ///</summary>
        
        public virtual int MenuRecipeID
        {
            get
            {
                return this.m_MenuRecipeID;
            }
            set
            {
                if (this.m_MenuRecipeID == value)
                    return;
                this.m_MenuRecipeID = value;
            }
        }
        public virtual int MenuID
        {
            get
            {
                return this.m_MenuID;
            }
            set
            {
                if (this.m_MenuID == value)
                    return;
                this.m_MenuID = value;
            }
        }
       
        public virtual String PortionSize
        {
            get
            {
                return this.m_PortionSize;
            }
            set
            {
                //if (value == null)
                //    throw new ArgumentNullException("value", "PortionSize does not allow null values.");
                //if (this.m_PortionSize == value)
                //    return;
                this.m_PortionSize = value;
            }
        }
        public virtual String Yield
        {
            get
            {
                return this.m_Yield;
            }
            set
            {
                //if (value == null)
                //    throw new ArgumentNullException("value", "Yield does not allow null values.");
                //if (this.m_Yield == value)
                //    return;
                this.m_Yield = value;
            }
        }
        public virtual String Preparation
        {
            get
            {
                return this.m_Preparation;
            }
            set
            {
                //if (value == null)
                //    throw new ArgumentNullException("value", "Preparation does not allow null values.");
                //if (this.m_Preparation == value)
                //    return;
                this.m_Preparation = value;
            }
        }
        public virtual String WrittenBy
        {
            get
            {
                return this.m_WrittenBy;
            }
            set
            {
                //if (value == null)
                //    throw new ArgumentNullException("value", "WrittenBy does not allow null values.");
                //if (this.m_WrittenBy == value)
                //    return;
                this.m_WrittenBy = value;
            }
        }
       
        public virtual DateTime EntryDate
        {
            get
            {
                return this.m_EntryDate;
            }
            set
            {
                if (this.m_EntryDate == value)
                    return;
                this.m_EntryDate = value;
            }
        }
        public virtual DateTime ModifiedDate
        {
            get
            {
                return this.m_ModifiedDate;
            }
            set
            {
                if (this.m_ModifiedDate == value)
                    return;
                this.m_ModifiedDate = value;
            }
        }
        
    }
}
