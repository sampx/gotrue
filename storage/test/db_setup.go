package test

import (
	"github.com/sampx/gotrue/conf"
	"github.com/sampx/gotrue/storage"
)

func SetupDBConnection(globalConfig *conf.GlobalConfiguration) (*storage.Connection, error) {
	return storage.Dial(globalConfig)
}
