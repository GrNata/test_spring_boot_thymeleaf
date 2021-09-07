<#import "parts_macros/common.ftlh" as c>

<@c.page>
Список пользователей

<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Role</th>
    </tr>
    </thead>
    <tbody>

    <#list users as user>
        <tr>
            <td>${user.username}</td>
<#--                <td>${user.email}</td>-->
            <td><#list user.roles as role>${role}<#sep>, </#list> </td>
            <td><a href="/user/${user.id}">Edit</a> </td>
        </tr>
    </#list>
    </tbody>
</table>

</@c.page>