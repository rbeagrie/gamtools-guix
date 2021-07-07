(use-modules ((guix licenses) #:prefix license:))
(use-modules (guix packages))
(use-modules (guix download))
(use-modules (gnu packages check))
(use-modules (gnu packages python))
(use-modules (gnu packages python-build))
(use-modules (gnu packages python-web))
(use-modules (gnu packages python-check))
(use-modules (gnu packages sphinx))
(use-modules (gnu packages xml))
(use-modules (gnu packages maths))
(use-modules (gnu packages bioinformatics))
(use-modules (guix build-system python))
(use-modules (gnu packages python-xyz))
(use-modules (gnu packages python-science))

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
    (version "2.0.0a5")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "http://rob.beagrie.com/media/gamtools-" version ".tar.gz"))
        (sha256
          (base32
            "02m296mwyxnlyfak3xg3q10lqw74c7lkaxvjk4019w738i3bdckf"))))
    (build-system python-build-system)
    (propagated-inputs
      `(("python-cython" ,python-cython)
        ("python-numpy" ,python-numpy)
        ("python-pandas" ,python-pandas)
        ("python-pytest" ,python-pytest)
        ("python-scipy" ,python-scipy)
        ("python-wrapit" ,python-wrapit)
        ("samtools" ,samtools)
        ("bowtie" ,bowtie)
        ("bedtools" ,bedtools)
        ("fastqc" ,fastqc)
        ("kentutils" ,kentutils)
        ("gsl" ,gsl)))
    (home-page "http://gam.tools")
    (synopsis
      "A package containing some utilities for analyzing GAM data.")
    (description
      "A package containing some utilities for analyzing GAM data.")
    (license #f)))

python-gamtools
