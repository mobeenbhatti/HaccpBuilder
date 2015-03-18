using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolHaccp.Common
{
    public class MenuRecipeDetails
    {
        private int m_MenuRecipeDetailID;
      private int m_MenuRecipeID;
      private int m_IngredientID;
      private int m_SortOrder;
      private string m_Specs;
      private string m_EPWeight;
      private string m_EPVolume;
      private string m_EPPercentage;


        public MenuRecipeDetails()
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
        public virtual int MenuRecipeDetailID
        {
            get
            {
                return this.m_MenuRecipeDetailID;
            }
            set
            {
                if (this.m_MenuRecipeDetailID == value)
                    return;
                this.m_MenuRecipeDetailID = value;
            }
        }
        public virtual int IngredientID
        {
            get
            {
                return this.m_IngredientID;
            }
            set
            {
                if (this.m_IngredientID == value)
                    return;
                this.m_IngredientID = value;
            }
        }
        public virtual int SortOrder
        {
            get
            {
                return this.m_SortOrder;
            }
            set
            {
                if (this.m_SortOrder == value)
                    return;
                this.m_SortOrder = value;
            }
        }

        public virtual String Specs
        {
            get
            {
                return this.m_Specs;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "PortionSize does not allow null values.");
                if (this.m_Specs == value)
                    return;
                this.m_Specs = value;
            }
        }
        public virtual String EPWeight
        {
            get
            {
                return this.m_EPWeight;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "Yield does not allow null values.");
                if (this.m_EPWeight == value)
                    return;
                this.m_EPWeight = value;
            }
        }
        public virtual String EPVolume
        {
            get
            {
                return this.m_EPVolume;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "Yield does not allow null values.");
                if (this.m_EPVolume == value)
                    return;
                this.m_EPVolume = value;
            }
        }
        public virtual String EPPercentage
        {
            get
            {
                return this.m_EPPercentage;
            }
            set
            {
                if (value == null)
                    throw new ArgumentNullException("value", "Yield does not allow null values.");
                if (this.m_EPPercentage == value)
                    return;
                this.m_EPPercentage = value;
            }
        }
      

    }
}
