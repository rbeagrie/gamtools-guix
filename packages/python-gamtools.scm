(define-module (python-gamtools)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages bioinformatics)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science))

(define-public python-pyinotify
  (package
    (name "python-pyinotify")
    (version "0.9.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyinotify" version))
       (sha256
        (base32
         "1x3i9wmzw33fpkis203alygfnrkcmq9w1aydcm887jh6frfqm6cw"))))
    (build-system python-build-system)
    (home-page "http://github.com/seb-m/pyinotify")
    (synopsis "Linux filesystem events monitoring")
    (description
     "Linux filesystem events monitoring")
    (license license:expat)))

(define-public python-doit
  (package
    (name "python-doit")
    (version "0.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://rob.beagrie.com/media/doit-" version ".tar.gz"))
       (sha256
        (base32
         "0vqapqhsd50iajyzmdsgskr671sjllcyzkivd2dz64p7m0602i8a"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-cloudpickle" ,python-cloudpickle)
       ("python-pyinotify" ,python-pyinotify)))
    (home-page "http://pydoit.org")
    (synopsis "doit - Automation Tool")
    (description "doit - Automation Tool")
    (license license:expat)))

(define-public python-wrapit
  (package
    (name "python-wrapit")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://rob.beagrie.com/media/wrapit-" version ".tar.gz"))
       (sha256
        (base32
         "0dsigqi7161af3kqm641c57xzmbxkr40nj2jma68ljicsch24jxp"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-doit" ,python-doit)))
    (home-page "https://github.com/rbeagrie/wrapit")
    (synopsis
     "A task loader for doit that supports argparse console scripts")
    (description
     "A task loader for doit that supports argparse console scripts")
    (license license:expat)))

(define-public python-gamtools
  (package
    (name "python-gamtools")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "gamtools" version))
       (sha256
        (base32
         "0fdlhgzlsxaa95fgmkabfs7b3z5xr09bsfihsknp94wc4j1bfydz"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-cython" ,python-cython)
       ("python-numpy" ,python-numpy)
       ("python-pandas" ,python-pandas)
       ("python-pytest" ,python-pytest)
       ("python-scipy" ,python-scipy)
       ("python-wrapit" ,python-wrapit)))
    (inputs
     `(("samtools" ,samtools)
       ("bowtie" ,bowtie)
       ("bedtools" ,bedtools)
       ("fastqc" ,fastqc)
       ("kentutils" ,kentutils)))
    (home-page "http://gam.tools")
    (synopsis
     "A package containing some utilities for analyzing GAM data.")
    (description
     "A package containing some utilities for analyzing GAM data.")
    (license #f)))

(define-public python-gamtools-testing
  (package
    (name "python-gamtools-testing")
    (version "2.0.0b1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://rob.beagrie.com/media/gamtools-" version ".tar.gz"))
       (sha256
        (base32
         "1p7ym61cl7qp0qq4y3g0n624d0i36ag9c8r5pvym0irwgaj4ixsv"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-cython" ,python-cython)
       ("python-numpy" ,python-numpy)
       ("python-pandas" ,python-pandas)
       ("python-pytest" ,python-pytest)
       ("python-scipy" ,python-scipy)
       ("python-wrapit" ,python-wrapit)))
    (inputs
     `(("samtools" ,samtools)
       ("bowtie" ,bowtie)
       ("bedtools" ,bedtools)
       ("fastqc" ,fastqc)
       ("kentutils" ,kentutils)))
    (home-page "http://gam.tools")
    (synopsis
     "A package containing some utilities for analyzing GAM data.")
    (description
     "A package containing some utilities for analyzing GAM data.")
    (license #f)))
