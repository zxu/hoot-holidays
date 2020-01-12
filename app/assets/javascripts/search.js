document.addEventListener("turbolinks:load", () => {
    // const $input = $("[data-behavior='autocomplete']").eq(0);

    const options = (target) => ({
        getValue: "name",
        url: function (phrase) {
            return "/auto_complete.json?q=" + phrase;
        },
        categories: [
            {
                listLocation: "airports",
                // header: "<strong>Airports</strong>",
            }
        ],
        list: {
            onChooseEvent: () => {
                const data = target.getSelectedItemData();
                // $input.val("");
                console.log(data);
            }
        }
    });

    // $input.easyAutocomplete(options);
    $("[data-behavior='autocomplete']").each((index, element) => {
        const $input = $(element);
        $input.easyAutocomplete(options($input));
    });

});


document.addEventListener('ajax:success', function (event) {
    const detail = event.detail;
    const data = detail[0], status = detail[1], xhr = detail[2];
    console.log(event);

    const target = event.target;
    console.log(target.id);

    // if (target.id === 'query-form') {
    //     sessionStorage.setItem('date', $('#date').val());
    // }

    console.log(arguments);

    // if (target.id === 'flights-form') {
    //     sessionStorage.setItem('date', $('#date').val());
    // }
});

document.addEventListener('ajax:beforeSend', function (event) {
    console.log("Before sending...")
    console.log(event);

    const {detail: [, {data}]} = event;
    console.log(data);
    if (data) {
        const params = new URLSearchParams(data);
        console.log('Data', params);

        for (const [key, value] of params) {
            console.log('========', key, value);
            sessionStorage.setItem(key, value);
        }
    }

    const newParams = new URLSearchParams();
    for (const key of Object.keys(sessionStorage)) {
        // console.log('========', key);
        newParams.append(key, sessionStorage.getItem(key));
        // sessionStorage.setItem(key, value);
    }

    event.detail[1].data = newParams.toString();


    // if (event.target.id === 'query-form') {
    //     console.log('Date', params.get('date'));
    // }
    //
    // if (event.target.id === 'flights-form') {
    //     console.log('Selected flight', params.get('selected-flight'));
    // }

});