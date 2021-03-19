List<FieldPermissions> fpToUpdate = new List<FieldPermissions>();

List<Id> permissionSetIDs = new List<Id>{'id1', 'id2'};

List<String> fields = new List<String>{'Object__c.Field__c'};

List<FieldPermissions> existingFieldPermissions = [SELECT Id,Field,ParentId,PermissionsEdit,PermissionsRead,SobjectType FROM FieldPermissions WHERE ParentId IN :permissionSetIDs AND Field IN :fields ];

Map<String, FieldPermissions> mapFieldPermissions = new Map<String, FieldPermissions>();

for(FieldPermissions fp: existingFieldPermissions){
    mapFieldPermissions.put(fp.ParentId + '-' + fp.Field, fp);
}

for(Id setId: permissionSetIDs){
    for(String field: fields){
        String key = setId + '-' + field;
        FieldPermissions fp = mapFieldPermissions.get(key);
        if(fp != null){
            fp.PermissionsRead = true;
        }else{
            fp = new FieldPermissions();
            fp.Field = field;
            fp.PermissionsRead = true;
            fp.SobjectType = field.split('\\.')[0];
            fp.ParentId = setId;
        }

        fp.PermissionsEdit = false;

        fpToUpdate.add(fp);
    }
}
upsert fpToUpdate;
