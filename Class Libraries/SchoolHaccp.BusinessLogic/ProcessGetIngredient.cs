using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

using SchoolHaccp.DataAccess.Select;
using SchoolHaccp.Common;

namespace SchoolHaccp.BusinessLogic
{
    [System.ComponentModel.DataObject]
    public class ProcessGetIngredient
    {
        private IDataReader m_ResultSet;
        private Ingredients m_Ingredient;
        private int m_TotalRecords;
        public ProcessGetIngredient()
        {
        }

        public void Invoke()
        {
            GetIngredients getIngredient = new GetIngredients();
            getIngredient.Ingredients = this.Ingredient;
            this.ResultSet = getIngredient.Get();
        }

        public IDataReader ResultSet
        {
            get { return m_ResultSet; }
            set { m_ResultSet = value; }
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetIngredientByKitchenId(int nKitchenId)
        {
            GetIngredients getLog = new GetIngredients();
            return getLog.GetIngredientsDataSet(nKitchenId);
        }
        public DataSet GetIngredientsByVendorId(int nVendorId)
        {
            GetIngredients getLog = new GetIngredients();
            return getLog.GetIngredientsByVendorId(nVendorId);
        }
        public DataSet GetIngredientsPagedDataSet(int nKitchenId, int nCurrentPage, int nPageSize)
        {

            GetIngredients getLog = new GetIngredients();
            DataSet ds = getLog.GetIngredientsPagedDataSet(nKitchenId, nCurrentPage, nPageSize);
            m_TotalRecords = getLog.TotalRecords;
            return ds;
        }
        public DataSet GetIngredientsPagedFlagDataSet(int nKitchenId, int nCurrentPage, int nPageSize)
        {

            GetIngredients getLog = new GetIngredients();
            DataSet ds = getLog.GetIngredientsPagedDataSet(nKitchenId, nCurrentPage, nPageSize);
            m_TotalRecords = getLog.TotalRecords;
            return ds;
        }
        public IDataReader GetIngredientByEntryDate(DateTime dtEntryDate, int nKitchenId)
        {
            GetIngredients getLog = new GetIngredients();
            return getLog.GetIngredientsByDate(dtEntryDate, nKitchenId);
        }
        public DataSet GetIngredientByName(string strName, int nKitchenId)
        {
            GetIngredients getLog = new GetIngredients();
            return getLog.GetIngredientByName(strName, nKitchenId);
        }
        public DataSet GetIngredientVendorsById(int nIngredientId)
        {
            GetIngredients getLog = new GetIngredients();
            return getLog.GetIngredientVendorsById(nIngredientId);
        }
        public IDataReader GetIngredientsByName(string strName, int nKitchenId)
        {
            GetIngredients getLog = new GetIngredients();
            return getLog.GetIngredientsByName(strName, nKitchenId);
        }
        public IDataReader GetIngredientNameById(string strName, int nIngredientId, int nKitchenId)
        {
            GetIngredients getLog = new GetIngredients();
            return getLog.GetIngredientNameById(strName, nIngredientId, nKitchenId);
        }
        public IDataReader GetIngredientsByMenuItemId(int nMenuItemId)
        {
            GetIngredients getLog = new GetIngredients();
            return getLog.GetIngredientsByMenuItemId(nMenuItemId);
        }
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public DataSet GetIngredientsByKitchenMenuItemId(int nKitchenId)
        {
            GetIngredients getLog = new GetIngredients();
            return getLog.GetIngredientsByKitchenMenuItemId(nKitchenId);
        }
        public IDataReader GetIngredientsLimit(int nKitchenId)
        {
            GetIngredients getLog = new GetIngredients();
            return getLog.GetIngredientsLimit(nKitchenId);
        }


       
        public Ingredients Ingredient
        {
            get { return m_Ingredient; }
            set { m_Ingredient = value; }
        }
        public int TotalRecords
        {
            get { return m_TotalRecords; }
            set { m_TotalRecords = value; }
        }
    }
}
