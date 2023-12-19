<section class="edit-card-menu" data-account-section="edit-cards">
    <div class="wrapper">
        <div class="title">
            <h2></h2>
        </div>
        <div class="account-menu__tab-item edit-card">
            <div class="account-menu__icon account-menu__icon--edit"></div>
            <div class="account-menu__info">
                <div class="account-menu__title">Edit card</div>
            </div>
        </div>
        <div class="account-menu__tab-item remove-card-btn">
            <div class="account-menu__icon account-menu__icon--remove"></div>
            <div class="account-menu__info">
                <div class="account-menu__title">Delete card</div>
            </div>
        </div>
        <div class="account-menu__tab-item make-default" data-default="">
            <div class="account-menu__icon account-menu__icon--default"></div>
            <div class="account-menu__info">
                <div class="account-menu__title">Make default</div>
            </div>
        </div>
        {{ include /account/remove-card }}
    </div>
</section>