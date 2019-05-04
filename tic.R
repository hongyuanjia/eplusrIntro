get_stage("before_install") %>%
    add_code_step(update.packages(ask = FALSE))

if (Sys.getenv("id_rsa") != "") {
    get_stage("before_deploy") %>%
        add_step(step_setup_ssh())

    get_stage("deploy") %>%
        add_code_step(eplusr::install_eplus(8.8)) %>%
        add_code_step(knitr::knit("index.Rmd")) %>%
        add_step(step_push_deploy(path = "branch", branch = "gh-pages"))
}
