### Task6_Creating infrastructure on AWS and Azure to launch Grafana on 80 port

Dear Granny, I know that time is stressfull now but today we need to launch Grafana on AWS and Azure in the way mentioned in the home [task](https://docs.google.com/document/d/1hxknpDiPfIDCFRAFUaZQVtm8BbpQpaX1gbPzxWuM-Y8/edit). No worries Honey, I will help you to do it without stress.

As you already know how to use GitHub we will not dive deep into details just make a clone of the [repo](https://github.com/Heckfy05/Task6) and we will continue. P.S If your amnesia still progresses [her](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) remainder for you.

1. First of all, you need to specify your credentials for AWS and Azure in the providers file. How to get credentials you can find [here for AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) and [here for Azure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_certificate)
2. As a next step, in the folder "Modules" you need specify the default statement of veriables in the folder "AWS" and then in the forlder "Azure_node". Path to the public key that you already [generate](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key) *.pub and path to bash script for installing Grafana.
3. I would hazard a guess, that you have already head-installed [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on your machine, so now you just need to initialize terraform in a folder that you just clone from the repo by the command     
   >$ terraform init

   and after succesfully executed one more command
   >$ terraform apply

When everything goes well you will see something like ![this](https://github.com/Heckfy05/Test/blob/main/1.jpeg?raw=true "succes")
and by following mentioned output IP's you will get to Grafana succsesfuly installed instances:
![AWS](https://github.com/Heckfy05/Test/blob/01434e7f4061b0405c0054374e22a537b7d9a952/2.jpeg?raw=true)
![Azure](https://github.com/Heckfy05/Test/blob/main/3.jpeg?raw=true)

I know that you will do everything according to my guidelines, so get what you want.
Stay strong and see you next time, Glory to Ukraine.
P.S. Don't forget to donate.
