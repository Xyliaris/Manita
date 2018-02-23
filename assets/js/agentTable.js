$(document).ready(function () {
  href_url = window.location.href;
  $("#agentTable").jqGrid({
      url: href_url + '/groupList',
    datatype: "json",
      colNames:['id',"Nom du groupe"],
      colModel:[
        {name:'idGroup',      index:'idGroup',      width:55,   template: "integerStr"},
        {name:'labelGroup',   index:'labelGroup',   width:90                          },
      ],
      rowNum:10,
      rowList:[10,20,30],
      sortname: 'idGroup',
      viewrecords: true,
      sortorder: "asc",
      loadonce: true,
      //autowidth: true,
      //multiSort: true,
      pager : '#gridpager',
      width: 200,
      height: "auto",
      caption:"Table Gestion Agents",
  });
});
