document.addEventListener("turbolinks:load", () => {
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
            }
        }
    });

    $("[data-behavior='autocomplete']").each((index, element) => {
        const $input = $(element);
        $input.easyAutocomplete(options($input));
    });
});

document.addEventListener('ajax:beforeSend', function (event) {
    const newParams = new URLSearchParams();
    const {detail: [, {data}]} = event;
    if (data) {
        const params = new URLSearchParams(data);

        for (const [key, value] of params) {
            if (key !== 'nav_back' && key !== 'commit') {
                sessionStorage.setItem(key, value);
            } else {
                newParams.append(key, value);
            }
        }
    }

    for (const key of Object.keys(sessionStorage)) {
        newParams.append(key, sessionStorage.getItem(key));
    }

    event.detail[1].data = newParams.toString();
});