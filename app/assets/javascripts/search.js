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

    // const $input1 = $("[data-behavior='autocomplete']").eq(1);
    //
    // const options1 = {
    //     getValue: "name",
    //     url: function (phrase) {
    //         return "/search.json?q=" + phrase;
    //     },
    //     categories: [
    //         {
    //             listLocation: "airports",
    //             header: "<strong>Airports</strong>",
    //         }
    //     ],
    //     list: {
    //         onChooseEvent: function () {
    //             const data = $input1.getSelectedItemData();
    //             // $input.val("");
    //             console.log(data);
    //         }
    //     }
    // };
    //
    // $input1.easyAutocomplete(options1);
});
