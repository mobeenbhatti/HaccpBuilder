using System;
using System.ComponentModel;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    public class Processes
    {
        private Int32 processId = (int)0;
        private String processName = string.Empty;
        private String processShortName = string.Empty;
        private Byte sortOrder = (byte)0;
        private Byte active = (byte)0;
        private Int32 processGroupId = (int)0;
        private Int32 custom = (int)0;
        private Int32 childProcessId = (int)0;
        private Int32 additional = (int)0;
        private string processText = string.Empty;
        //private String field1 = string.Empty;
        //private String field2 = string.Empty;
        //private String field3 = string.Empty;
        //private String field4 = string.Empty;
        //private String field5 = string.Empty;
        //private String field6 = string.Empty;
        //private String field7 = string.Empty;
        //private String field8 = string.Empty;
        //private String field9 = string.Empty;
        //private String field10 = string.Empty;
        private ArrayList kitchenMenuCustomOldList = null;
        private ArrayList menuItemsNewList = null;
        private ArrayList menuItemsList = null;
        private ArrayList menuCustomList = null;
        private ArrayList kitchenmenuitemsoldList = null;
        
        public Processes()
        {
        }

        ///<summary>
        /// Creates a new <see cref="ProcessesBase"/> instance by taking parameters.
        ///</summary>   
        [ReadOnlyAttribute(false), DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Int32 ProcessId
        {
            get
            {
                return this.processId;
            }
            set
            {
                if (this.processId == value)
                    return;
                this.processId = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual String ProcessName
        {
            get
            {
                return this.processName;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "processName does not allow null values.");
                if (this.processName == value)
                    return;
                this.processName = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual String ProcessShortName
        {
            get
            {
                return this.processShortName;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "processShortName does not allow null values.");
                if (this.processShortName == value)
                    return;
                this.processShortName = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Byte SortOrder
        {
            get
            {
                return this.sortOrder;
            }
            set
            {
                if (this.sortOrder == value)
                    return;
                this.sortOrder = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Byte Active
        {
            get
            {
                return this.active;
            }
            set
            {
                if (this.active == value)
                    return;
                this.active = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Int32 ProcessGroupId
        {
            get
            {
                return this.processGroupId;
            }
            set
            {
                if (this.processGroupId == value)
                    return;
                this.processGroupId = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Int32 Custom
        {
            get
            {
                return this.custom;
            }
            set
            {
                if (this.custom == value)
                    return;
                this.custom = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Int32 ChildProcessId
        {
            get
            {
                return this.childProcessId;
            }
            set
            {
                if (this.childProcessId == value)
                    return;
                this.childProcessId = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual Int32 Additional
        {
            get
            {
                return this.additional;
            }
            set
            {
                if (this.additional == value)
                    return;
                this.additional = value;
            }
        }
        [DescriptionAttribute(""), BindableAttribute(true)]
        public virtual String ProcessText
        {
            get
            {
                return this.processText;
            }
            set
            {
                if (this.processText == value)
                    return;
                this.processText = value;
            }
        }
    }
}
