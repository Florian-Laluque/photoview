PORTNAME=       photoview
PORTVERSION=    2.3.13
DISTVERSIONPREFIX=      v
CATEGORIES=     multimedia 

MAINTAINER=     dmgk@FreeBSD.org
COMMENT=        Blabla bla
WWW=            https://github.com/photoview/photoview/api

LICENSE=        AGPLv3
LICENSE_FILE=   ${WRKSRC}/../LICENSE.txt

USES=           go:modules localbase
USE_GITHUB=	yes
GH_ACCOUNT=	photoview
WRKSRC_SUBDIR=	api

MAKE_CMD=       ${LOCALBASE}/bin/go build
MAKE_ENV=       GOPATH="${WRKSRC}/.gopath:${WRKSRC}/vendor" \
                CGO_CFLAGS="${CFLAGS}" CGO_CPPFLAGS="${CPPFLAGS}" \
                CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="-L${LOCALBASE}/lib ${LDFLAGS}" \
                GO111MODULE=off

.include <bsd.port.options.mk>

# Patch 
.if ${ARCH} == "arm64"
EXTRA_PATCHES=	${PATCHDIR}/patch-vendor_github.com_Kagami_go-face_face.go
.endif

GH_TUPLE=	\
		99designs:gqlgen:v0.17.12:99designs_gqlgen/vendor/github.com/99designs/gqlgen \
		Kagami:go-face:0c14797b4d0e:kagami_go_face/vendor/github.com/Kagami/go-face \
		agnivade:levenshtein:v1.1.1:agnivade_levenshtein/vendor/github.com/agnivade/levenshtein \
		barasher:go-exiftool:v1.8.0:barasher_go_exiftool/vendor/github.com/barasher/go-exiftool \
		buckket:go-blurhash:v1.1.0:buckket_go_blurhash/vendor/github.com/buckket/go-blurhash \
		davecgh:go-spew:v1.1.1:davecgh_go_spew/vendor/github.com/davecgh/go-spew \
		disintegration:imaging:v1.6.2:disintegration_imaging/vendor/github.com/disintegration/imaging \
		felixge:httpsnoop:v1.0.3:felixge_httpsnoop/vendor/github.com/felixge/httpsnoop \
		go-gorm:gorm:v1.23.7:go_gorm_gorm/vendor/gorm.io/gorm \
		go-gorm:mysql:v1.3.4:go_gorm_mysql/vendor/gorm.io/driver/mysql \
		go-gorm:postgres:v1.3.8:go_gorm_postgres/vendor/gorm.io/driver/postgres \
		go-gorm:sqlite:v1.3.5:go_gorm_sqlite/vendor/gorm.io/driver/sqlite \
		go-sql-driver:mysql:v1.6.0:go_sql_driver_mysql/vendor/github.com/go-sql-driver/mysql \
		go-yaml:yaml:v3.0.1:go_yaml_yaml/vendor/gopkg.in/yaml.v3 \
		golang:crypto:05595931fe9d:golang_crypto/vendor/golang.org/x/crypto \
		golang:image:41969df76e82:golang_image/vendor/golang.org/x/image \
		golang:text:v0.3.7:golang_text/vendor/golang.org/x/text \
		gorilla:handlers:v1.5.1:gorilla_handlers/vendor/github.com/gorilla/handlers \
		gorilla:mux:v1.8.0:gorilla_mux/vendor/github.com/gorilla/mux \
		gorilla:websocket:v1.5.0:gorilla_websocket/vendor/github.com/gorilla/websocket \
		h2non:filetype:v1.1.3:h2non_filetype/vendor/github.com/h2non/filetype \
		hashicorp:golang-lru:v0.5.4:hashicorp_golang_lru/vendor/github.com/hashicorp/golang-lru \
		jackc:chunkreader:v2.0.1:jackc_chunkreader_v2/vendor/github.com/jackc/chunkreader/v2 \
		jackc:pgconn:v1.12.1:jackc_pgconn/vendor/github.com/jackc/pgconn \
		jackc:pgio:v1.0.0:jackc_pgio/vendor/github.com/jackc/pgio \
		jackc:pgpassfile:v1.0.0:jackc_pgpassfile/vendor/github.com/jackc/pgpassfile \
		jackc:pgproto3:v2.3.0:jackc_pgproto3_v2/vendor/github.com/jackc/pgproto3/v2 \
		jackc:pgservicefile:2b9c44734f2b:jackc_pgservicefile/vendor/github.com/jackc/pgservicefile \
		jackc:pgtype:v1.11.0:jackc_pgtype/vendor/github.com/jackc/pgtype \
		jackc:pgx:v4.16.1:jackc_pgx_v4/vendor/github.com/jackc/pgx/v4 \
		jinzhu:inflection:v1.0.0:jinzhu_inflection/vendor/github.com/jinzhu/inflection \
		jinzhu:now:v1.1.5:jinzhu_now/vendor/github.com/jinzhu/now \
		joho:godotenv:v1.4.0:joho_godotenv/vendor/github.com/joho/godotenv \
		mattn:go-sqlite3:v1.14.14:mattn_go_sqlite3/vendor/github.com/mattn/go-sqlite3 \
		mitchellh:mapstructure:v1.5.0:mitchellh_mapstructure/vendor/github.com/mitchellh/mapstructure \
		otiai10:copy:v1.7.0:otiai10_copy/vendor/github.com/otiai10/copy \
		pkg:errors:v0.9.1:pkg_errors/vendor/github.com/pkg/errors \
		pmezard:go-difflib:v1.0.0:pmezard_go_difflib/vendor/github.com/pmezard/go-difflib \
		sabhiram:go-gitignore:525f6e181f06:sabhiram_go_gitignore/vendor/github.com/sabhiram/go-gitignore \
		stretchr:testify:v1.8.0:stretchr_testify/vendor/github.com/stretchr/testify \
		strukturag:libheif:v1.12.0:strukturag_libheif/vendor/github.com/strukturag/libheif \
		vansante:go-ffprobe:v2.0.3:vansante_go_ffprobe/vendor/gopkg.in/vansante/go-ffprobe.v2 \
		vektah:gqlparser:v2.4.6:vektah_gqlparser_v2/vendor/github.com/vektah/gqlparser/v2 \
		wsxiaoys:terminal:0940f3fc43a0:wsxiaoys_terminal/vendor/github.com/wsxiaoys/terminal \
		xor-gate:goexif2:v1.1.0:xor_gate_goexif2/vendor/github.com/xor-gate/goexif2


LIB_DEPENDS= libheif.so:graphics/libheif \
		libjpeg.so:graphics/libjpeg \
		liblapack.so:math/lapack \
		libcblas.so:math/cblas \
		libblas.so:devel/liblas \
		libdlib.so:science/dlib-cpp
BUILD_DEPENDS=	pkgconf:devel/pkgconf

PLIST_FILES=    bin/photoview

.include <bsd.port.mk>
