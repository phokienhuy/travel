using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for User_MasterPage
/// </summary>
public class User_MasterPage : MasterPage
{
    public TravelDataContext db = new TravelDataContext();
	public User_MasterPage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}