get_stage("before_install") %>%
    add_code_step(update.packages(ask = FALSE))

if (Sys.getenv("id_rsa") != "") {
    get_stage("before_deploy") %>%
        add_step(step_setup_ssh()) %>%
        add_step(step_setup_push_deploy(path = ".", branch = "gh-pages", remote_url = NULL,
            orphan = TRUE, checkout = FALSE))

    get_stage("deploy") %>%
        add_code_step(eplusr::install_eplus(8.8)) %>%
        add_code_step(remotes::install_github("gadenbuie/xaringanthemer")) %>%
        add_code_step(remotes::install_github("ropenscilabs/icon")) %>%
        add_code_step(install.packages("xaringan")) %>%
        add_code_step(rmarkdown::render("index.Rmd")) %>%
        add_step(step_push_deploy(path = ".", branch = "gh-pages"))
}
