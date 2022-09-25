<div id="top"></div>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url] [![Forks][forks-shield]][forks-url] [![Stargazers][stars-shield]][stars-url] [![Issues][issues-shield]][issues-url] [![MIT License][license-shield]][license-url] [![LinkedIn][linkedin-shield]][linkedin-url]

<h2 align="center">Reverse Proxy Installer</h2>

  <p align="center">
    Clean Reverse Proxy installation from scratch using nginx and letsencrypt
    <br />
    <br />
    <a href="https://github.com/cosimoscarcella/server-installer/issues">Report Bug</a>
    ·
    <a href="https://github.com/cosimoscarcella/server-installer/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## 🚧 About The Project

This is a useful project that allows the installation of a complete reverse proxy environment using **nginx** and **certbot**.
The certbot container is responsible to create and renew letsencrypt certificates.
The installation leverages *shell scripts*, *docker*, *docker-compose*, and *cron expressions* to renew the certificates.

<p align="right">(<a href="#top">back to top</a>)</p>


### Built With

<p>
  <a href="https://www.docker.com/" target="_blank"> <img src="https://github.com/cosimoscarcella/cosimoscarcella/raw/main/images/logo-docker.svg" alt="docker" width="64" height="64"/></a>
  <a href="https://docs.docker.com/compose/" target="_blank"> <img src="https://github.com/cosimoscarcella/cosimoscarcella/raw/main/images/logo-docker-compose.svg" alt="docker" width="64" height="64"/></a>
  <a href="https://docs.docker.com/compose/" target="_blank"> <img src="https://github.com/cosimoscarcella/cosimoscarcella/raw/main/images/logo-nginx.svg" alt="docker" width="64" height="64"/></a>
  <a href="https://docs.docker.com/compose/" target="_blank"> <img src="https://github.com/cosimoscarcella/cosimoscarcella/raw/main/images/logo-letsencrypt.svg" alt="docker" width="64" height="64"/></a>
</p>

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## 🏃 Getting Started

To get your Server installation running follow these simple steps.

### Prerequisites

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)


### Installation

1. Clone the repo in the user directory
   ```sh
   git clone https://github.com/cosimoscarcella/reverse-proxy-installer.git
   ```
2. Go into the created folder
   ```sh
   cd ./reverse-proxy-installer
   find . -type f -iname "*.sh" -exec chmod +x {} \;
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## 🚀 Usage

### Install

1. Make sure to have Port Forwarding enabled to port 80 and 433
2. Modify passwords and variables inside ```.env``` file as you wish
3. Run shell command
   ```sh
   sh install.sh
   ```
4. Your server installation is now available at [http://localhost]( http://localhost) and [https://localhost]( https://localhost)


### Uninstall

1. Run shell command
   ```sh
   ./uninstall.sh
   ```
2. Use ```-h | --help``` option for further information

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## 🤝 Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## 📝 License

Distributed under the **MIT License**. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## ✍️ Author

👤 **Cosimo Scarcella**

- <img align="center" src="https://github.com/cosimoscarcella/cosimoscarcella/raw/main/images/social-btn-twitter.svg" alt="twitter" width="20" height="20"/> Twitter: [@ScarcellaCosimo](https://twitter.com/ScarcellaCosimo)
- <img align="center" src="https://github.com/cosimoscarcella/cosimoscarcella/raw/main/images/social-btn-github.svg" alt="github" width="20" height="20"/>  Github: [@cosimoscarcella](https://github.com/cosimoscarcella)
- 📧 Mail: [cosimo.scarcella@gmail.com](mailto:cosimo.scarcella@gmail.com)


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## 🏆 Acknowledgments

* [https://mindsers.blog/post/https-using-nginx-certbot-docker/](https://mindsers.blog/post/https-using-nginx-certbot-docker/)

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/cosimoscarcella/reverse-proxy-installer.svg?style=for-the-badge
[contributors-url]: https://github.com/cosimoscarcella/reverse-proxy-installer/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/cosimoscarcella/reverse-proxy-installer.svg?style=for-the-badge
[forks-url]: https://github.com/cosimoscarcella/reverse-proxy-installer/network/members
[stars-shield]: https://img.shields.io/github/stars/cosimoscarcella/reverse-proxy-installer.svg?style=for-the-badge
[stars-url]: https://github.com/cosimoscarcella/reverse-proxy-installer/stargazers
[issues-shield]: https://img.shields.io/github/issues/cosimoscarcella/reverse-proxy-installer.svg?style=for-the-badge
[issues-url]: https://github.com/cosimoscarcella/reverse-proxy-installer/issues
[license-shield]: https://img.shields.io/github/license/cosimoscarcella/reverse-proxy-installer.svg?style=for-the-badge
[license-url]: https://github.com/cosimoscarcella/reverse-proxy-installer/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/cosimo-scarcella
[product-screenshot]: images/screenshot.png
