node state {
    has title;
    has message;
    has prompts;
}

edge transition {
    has intent;
}

graph main_graph {

    has anchor main_root;

    spawn {
        
        main_root = spawn node::state(
                                title="Greeting",
                                message ="Hello there! Thank you for contacting us! What can I help you with??",
                                prompts =["General Business Queries","Appointment Related Questions", "Service Quires", "Quit"]
                                );


        gbq = spawn main_root -[transition(intent="General Business Queries")]-> node::state(
                                title="General Business Queries",
                                message ="Great! What do you need to know about our bussiness?",
                                prompts =["Office Hours","Payment Methods", "Phone Number", "Email Address", "Promotions", "Back", "Quit"]
                                );

        gbq -[transition(intent="back")]-> main_root;


        offhrs = spawn gbq -[transition(intent="Office Hours")]-> node::state(
                                title="Office Hours",
                                message ="You can visit us on:\n  Monday: 9am - 5pm\n  Tuesday: 9am - 5pm\n  Wednesday: 9am - 5pm\n  Thursday: 9am - 5pm\n  Fridy: 9am - 5pm\n",
                                prompts =["Back", "Quit"]
                                );

        offhrs -[transition(intent="back")]-> gbq;


        paymeth = spawn gbq -[transition(intent="Payment Methods")]-> node::state(
                                title="Payment Methods",
                                message ="You can pay us by:",
                                prompts =["Back", "Quit"]
                                );

        paymeth -[transition(intent="back")]-> gbq;


        pnum = spawn gbq -[transition(intent="Phone Number")]-> node::state(
                                title="Phone Number",
                                message ="You can call us on ***********",
                                prompts =["Back", "Quit"]
                                );

        pnum -[transition(intent="back")]-> gbq;


        email = spawn gbq -[transition(intent="Email Address")]-> node::state(
                                title="Email Address",
                                message ="Our email address is:",
                                prompts =["Back", "Quit"]
                                );

        email -[transition(intent="back")]-> gbq;


        promo = spawn gbq -[transition(intent="Promotions")]-> node::state(
                                title="Promotions",
                                message ="Our current promotions are:",
                                prompts =["Back", "Quit"]
                                 );

        promo -[transition(intent="back")]-> gbq;
        

        arq = spawn main_root -[transition(intent="Appointment Related Questions")]-> node::state(
                              title="Appointment Related Questions",
                              message ="Amazing! What is it you want more information on?",
                              prompts =["Cancelling Appointments"," Rescheduling appointments ", "Refunds", "Feedback", "Back", "Quit"]
                               );

        arq -[transition(intent="back")]-> main_root;


        cancelapp = spawn arq -[transition(intent="Cancelling Appointments")]-> node::state(
                                title="Cancelling Appointments",
                                message ="We are sorry to here you would like to cancel your appointment. In order to cancel an appointment...",
                                prompts =["Back", "Quit"]
                                );

        cancelapp -[transition(intent="back")]-> arq;


        reschedule = spawn arq -[transition(intent="Rescheduling appointments")]-> node::state(
                                title="Rescheduling appointments",
                                message ="In order to reschedule an appointment...",
                                prompts =["Back", "Quit"]
                                );

        reschedule -[transition(intent="back")]-> arq;


        refund = spawn arq -[transition(intent="Refunds")]-> node::state(
                                title="Refunds",
                                message ="In order to get refunded for an appointment...",
                                prompts =["Back", "Quit"]
                                );

        refund -[transition(intent="back")]-> arq;

        feedback = spawn arq -[transition(intent="Feedback")]-> node::state(
                                title="Feedback",
                                message ="We will love to have your feedback on your expereince. To leave a review...",
                                prompts =["Back", "Quit"]
                                );

        feedback -[transition(intent="back")]-> arq;

        svq = spawn main_root -[transition(intent="Service Quires")]-> node::state(
                              title="Service Quires",
                              message ="We have quite a few amazing sevices! We are offering:\n  1.Manicures\n  2.Haircuts\n  3.Wedding Makeup\n  4.Eyebrows\n  5.Facial Treatments\n  6.Spa\n  7.Pedicure\n  8.Hair Steaming\n",
                              prompts =[ "back", "Quit"]
                              );

        svq -[transition(intent="back")]-> main_root;

    }

}
