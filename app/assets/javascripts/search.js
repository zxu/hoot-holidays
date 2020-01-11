document.addEventListener("turbolinks:load", () => {
    const $input = $("[data-behavior='autocomplete']").eq(0);

    const options = {
        getValue: "name",
        url: function (phrase) {
            return "/search.json?q=" + phrase;
        },
        categories: [
            {
                listLocation: "airports",
                header: "<strong>Airports</strong>",
            }
        ],
        list: {
            onChooseEvent: (evt) => {
                console.log(evt);
                const data = $input.getSelectedItemData();
                // $input.val("");
                console.log(data);
            }
        }
    };

    $input.easyAutocomplete(options);

    const $input1 = $("[data-behavior='autocomplete']").eq(1);

    const options1 = {
        getValue: "name",
        url: function (phrase) {
            return "/search.json?q=" + phrase;
        },
        categories: [
            {
                listLocation: "airports",
                header: "<strong>Airports</strong>",
            }
        ],
        list: {
            onChooseEvent: function () {
                const data = $input1.getSelectedItemData();
                // $input.val("");
                console.log(data);
            }
        }
    };

    $input1.easyAutocomplete(options1);
});
