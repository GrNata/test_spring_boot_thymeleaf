<#import "parts_macros/common.ftlh" as c>

<@c.page>

    <h2>profile.html</h2>

    <h5>${username}</h5>
    ${message?ifExists}

    <form method="post">
        <div class="form-group row align-items-center mt-3">
            <label for="exampleInputPassword1" class="col-2"> Password: </label>
            <input type="password" name="password"
                   class="col-6" id="exampleInputPassword1" placeholder="Password"/>
        </div>
        <div class="form-group row align-items-center mt-3">
            <label for="exampleInputPassword1" class="col-2"> Email: </label>
            <input type="email" name="email"
                   class="col-6" id="exampleInputPassword1" placeholder="some@some.com" value="${email!''}"/>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <button type="submit" class="btn btn-primary m-5">Save</button>
    </form>


</@c.page>