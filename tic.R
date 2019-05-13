if (Sys.getenv("id_rsa") != "") {
    get_stage("before_deploy") %>%
        add_step(step_setup_ssh()) %>%
        add_step(step_setup_push_deploy(path = ".", branch = "gh-pages"))

    get_stage("deploy") %>%
        add_code_step(remotes::install_deps()) %>%
        add_code_step(rmarkdown::render("index.Rmd")) %>%
        add_step(step_push_deploy(path = ".", branch = "gh-pages"))
}
